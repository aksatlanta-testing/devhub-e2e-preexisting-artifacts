
{{- define "go-echo19580da2-bfc5-4502-a35b-2028d76a365e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo19580da2-bfc5-4502-a35b-2028d76a365e.fullname" -}}
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


{{- define "go-echo19580da2-bfc5-4502-a35b-2028d76a365e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo19580da2-bfc5-4502-a35b-2028d76a365e.labels" -}}
helm.sh/chart: {{ include "go-echo19580da2-bfc5-4502-a35b-2028d76a365e.chart" . }}
{{ include "go-echo19580da2-bfc5-4502-a35b-2028d76a365e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo19580da2-bfc5-4502-a35b-2028d76a365e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo19580da2-bfc5-4502-a35b-2028d76a365e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}