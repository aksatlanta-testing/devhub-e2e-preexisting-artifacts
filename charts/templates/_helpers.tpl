
{{- define "go-echo357c3ac2-fc36-4877-ae68-62d341420680.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo357c3ac2-fc36-4877-ae68-62d341420680.fullname" -}}
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


{{- define "go-echo357c3ac2-fc36-4877-ae68-62d341420680.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo357c3ac2-fc36-4877-ae68-62d341420680.labels" -}}
helm.sh/chart: {{ include "go-echo357c3ac2-fc36-4877-ae68-62d341420680.chart" . }}
{{ include "go-echo357c3ac2-fc36-4877-ae68-62d341420680.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo357c3ac2-fc36-4877-ae68-62d341420680.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo357c3ac2-fc36-4877-ae68-62d341420680.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}