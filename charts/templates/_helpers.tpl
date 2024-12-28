
{{- define "go-echo36150f86-5413-4706-a36e-a581dd2262fb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo36150f86-5413-4706-a36e-a581dd2262fb.fullname" -}}
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


{{- define "go-echo36150f86-5413-4706-a36e-a581dd2262fb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo36150f86-5413-4706-a36e-a581dd2262fb.labels" -}}
helm.sh/chart: {{ include "go-echo36150f86-5413-4706-a36e-a581dd2262fb.chart" . }}
{{ include "go-echo36150f86-5413-4706-a36e-a581dd2262fb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo36150f86-5413-4706-a36e-a581dd2262fb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo36150f86-5413-4706-a36e-a581dd2262fb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}