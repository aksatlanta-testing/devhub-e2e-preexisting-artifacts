
{{- define "go-echoc9149d1a-efa3-4b2c-a75d-0476dfc84fac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc9149d1a-efa3-4b2c-a75d-0476dfc84fac.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoc9149d1a-efa3-4b2c-a75d-0476dfc84fac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc9149d1a-efa3-4b2c-a75d-0476dfc84fac.labels" -}}
helm.sh/chart: {{ include "go-echoc9149d1a-efa3-4b2c-a75d-0476dfc84fac.chart" . }}
{{ include "go-echoc9149d1a-efa3-4b2c-a75d-0476dfc84fac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc9149d1a-efa3-4b2c-a75d-0476dfc84fac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc9149d1a-efa3-4b2c-a75d-0476dfc84fac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}