
{{- define "go-echoed76653a-c43c-4888-ad6f-203d2185cbcf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed76653a-c43c-4888-ad6f-203d2185cbcf.fullname" -}}
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


{{- define "go-echoed76653a-c43c-4888-ad6f-203d2185cbcf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed76653a-c43c-4888-ad6f-203d2185cbcf.labels" -}}
helm.sh/chart: {{ include "go-echoed76653a-c43c-4888-ad6f-203d2185cbcf.chart" . }}
{{ include "go-echoed76653a-c43c-4888-ad6f-203d2185cbcf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoed76653a-c43c-4888-ad6f-203d2185cbcf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoed76653a-c43c-4888-ad6f-203d2185cbcf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}