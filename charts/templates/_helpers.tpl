
{{- define "go-echo9a421a3b-554c-42ef-8f94-a8c7aa7205bf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9a421a3b-554c-42ef-8f94-a8c7aa7205bf.fullname" -}}
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


{{- define "go-echo9a421a3b-554c-42ef-8f94-a8c7aa7205bf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9a421a3b-554c-42ef-8f94-a8c7aa7205bf.labels" -}}
helm.sh/chart: {{ include "go-echo9a421a3b-554c-42ef-8f94-a8c7aa7205bf.chart" . }}
{{ include "go-echo9a421a3b-554c-42ef-8f94-a8c7aa7205bf.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9a421a3b-554c-42ef-8f94-a8c7aa7205bf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9a421a3b-554c-42ef-8f94-a8c7aa7205bf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}