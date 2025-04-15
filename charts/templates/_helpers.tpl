
{{- define "go-echobb410f5c-b459-40c9-81d9-d1d008f8bdfd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb410f5c-b459-40c9-81d9-d1d008f8bdfd.fullname" -}}
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


{{- define "go-echobb410f5c-b459-40c9-81d9-d1d008f8bdfd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb410f5c-b459-40c9-81d9-d1d008f8bdfd.labels" -}}
helm.sh/chart: {{ include "go-echobb410f5c-b459-40c9-81d9-d1d008f8bdfd.chart" . }}
{{ include "go-echobb410f5c-b459-40c9-81d9-d1d008f8bdfd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobb410f5c-b459-40c9-81d9-d1d008f8bdfd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobb410f5c-b459-40c9-81d9-d1d008f8bdfd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}