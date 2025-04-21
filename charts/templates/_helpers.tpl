
{{- define "go-echo20189ac0-e420-4472-92c6-fde081a8fedc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo20189ac0-e420-4472-92c6-fde081a8fedc.fullname" -}}
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


{{- define "go-echo20189ac0-e420-4472-92c6-fde081a8fedc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo20189ac0-e420-4472-92c6-fde081a8fedc.labels" -}}
helm.sh/chart: {{ include "go-echo20189ac0-e420-4472-92c6-fde081a8fedc.chart" . }}
{{ include "go-echo20189ac0-e420-4472-92c6-fde081a8fedc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo20189ac0-e420-4472-92c6-fde081a8fedc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo20189ac0-e420-4472-92c6-fde081a8fedc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}