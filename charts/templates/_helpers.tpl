
{{- define "go-echoedc6ad7a-ae65-4783-8fbf-2ba1cf90beec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedc6ad7a-ae65-4783-8fbf-2ba1cf90beec.fullname" -}}
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


{{- define "go-echoedc6ad7a-ae65-4783-8fbf-2ba1cf90beec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedc6ad7a-ae65-4783-8fbf-2ba1cf90beec.labels" -}}
helm.sh/chart: {{ include "go-echoedc6ad7a-ae65-4783-8fbf-2ba1cf90beec.chart" . }}
{{ include "go-echoedc6ad7a-ae65-4783-8fbf-2ba1cf90beec.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoedc6ad7a-ae65-4783-8fbf-2ba1cf90beec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoedc6ad7a-ae65-4783-8fbf-2ba1cf90beec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}