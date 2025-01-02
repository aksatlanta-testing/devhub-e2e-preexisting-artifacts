
{{- define "go-echo5cb8c361-1dda-4dd2-8881-f411ab3a032f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5cb8c361-1dda-4dd2-8881-f411ab3a032f.fullname" -}}
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


{{- define "go-echo5cb8c361-1dda-4dd2-8881-f411ab3a032f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5cb8c361-1dda-4dd2-8881-f411ab3a032f.labels" -}}
helm.sh/chart: {{ include "go-echo5cb8c361-1dda-4dd2-8881-f411ab3a032f.chart" . }}
{{ include "go-echo5cb8c361-1dda-4dd2-8881-f411ab3a032f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5cb8c361-1dda-4dd2-8881-f411ab3a032f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5cb8c361-1dda-4dd2-8881-f411ab3a032f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}