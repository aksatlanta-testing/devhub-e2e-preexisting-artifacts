
{{- define "go-echo6471aeed-fe54-44c4-8656-45f29021537c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6471aeed-fe54-44c4-8656-45f29021537c.fullname" -}}
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


{{- define "go-echo6471aeed-fe54-44c4-8656-45f29021537c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6471aeed-fe54-44c4-8656-45f29021537c.labels" -}}
helm.sh/chart: {{ include "go-echo6471aeed-fe54-44c4-8656-45f29021537c.chart" . }}
{{ include "go-echo6471aeed-fe54-44c4-8656-45f29021537c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6471aeed-fe54-44c4-8656-45f29021537c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6471aeed-fe54-44c4-8656-45f29021537c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}