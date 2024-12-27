
{{- define "go-echo6a559df9-5823-4b57-a0f3-c18aa7b0c9bf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6a559df9-5823-4b57-a0f3-c18aa7b0c9bf.fullname" -}}
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


{{- define "go-echo6a559df9-5823-4b57-a0f3-c18aa7b0c9bf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6a559df9-5823-4b57-a0f3-c18aa7b0c9bf.labels" -}}
helm.sh/chart: {{ include "go-echo6a559df9-5823-4b57-a0f3-c18aa7b0c9bf.chart" . }}
{{ include "go-echo6a559df9-5823-4b57-a0f3-c18aa7b0c9bf.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6a559df9-5823-4b57-a0f3-c18aa7b0c9bf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6a559df9-5823-4b57-a0f3-c18aa7b0c9bf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}