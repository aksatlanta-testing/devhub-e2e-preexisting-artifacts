
{{- define "go-echoda1b75c8-7f4f-49d9-b656-9e38b1f40335.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda1b75c8-7f4f-49d9-b656-9e38b1f40335.fullname" -}}
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


{{- define "go-echoda1b75c8-7f4f-49d9-b656-9e38b1f40335.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda1b75c8-7f4f-49d9-b656-9e38b1f40335.labels" -}}
helm.sh/chart: {{ include "go-echoda1b75c8-7f4f-49d9-b656-9e38b1f40335.chart" . }}
{{ include "go-echoda1b75c8-7f4f-49d9-b656-9e38b1f40335.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda1b75c8-7f4f-49d9-b656-9e38b1f40335.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda1b75c8-7f4f-49d9-b656-9e38b1f40335.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}